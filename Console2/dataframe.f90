    program dataframe_example
        implicit none

        type :: Row
            real :: column1
            real :: column2
            character(len=20) :: column3
            logical :: column4
        end type Row

        type(Row), allocatable :: dataframe(:)

        integer :: n_rows, i

        ! Example DataFrame with 3 rows
        n_rows = 3
        allocate(dataframe(n_rows))

        ! Populate the DataFrame
        dataframe(1) = Row(1.0, 2.0, "Row1", .TRUE.)
        dataframe(2) = Row(3.0, 4.0, "Row2", .FALSE.)
        dataframe(3) = Row(5.0, 6.0, "Row3", .FALSE.)

        ! Access and print the DataFrame
        do i = 1, n_rows
            print *, "Row ", i, ": ", dataframe(i)%column1, dataframe(i)%column2, dataframe(i)%column3, dataframe(i)%column4
        end do

    end program dataframe_example