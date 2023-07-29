import 'package:online_learning_app/export.dart';

import '../../bloc/course/category/add_category/add_category_bloc.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryC = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  )),
              const SizedBox(height: 20),
              Text(
                'Nama Category',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                controller: categoryC,
                autocorrect: false,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  hintText: 'Tambah Category Baru',
                  hintStyle: greyTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: kGreyColor,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.abc_outlined,
                    color: kGreyColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              BlocConsumer<AddCategoryBloc, AddCategoryState>(
                listener: (context, state) {
                  if (state is AddCategorySuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 5),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: kGreenColor,
                        content: Row(
                          children: [
                            const Icon(Icons.beenhere_rounded, color: Colors.white),
                            const SizedBox(width: 12),
                            Text(
                              'Success add new Category',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  } else if (state is AddCategoryError) {
                    Center(
                      child: Text(
                        state.message,
                        style: redTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    );
                  } else if (state is AddCategoryLoading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      context.read<AddCategoryBloc>().add(AddNewCategoryEvent(name: categoryC.text));
                    },
                    title: 'Tambah Kategori',
                    backgroundColor: kPrimaryColor,
                    style: whiteTextStyle.copyWith(fontWeight: bold),
                    borderRadius: 20,
                    height: 50,
                    width: double.infinity,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
