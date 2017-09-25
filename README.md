# Write-Block

Prints a block of characters around your text

## Getting Started

Load the Cmdlet into your PS session

```
. .\Write-Block.ps1
```

Now you can run it

```
Write-Block "My text here"
```

To save the output of the function, I recommend piping STDOUT rather than using
Out-File.

```
Write-Block "My text here" > MyFile.txt
```

## Example

```
$messages = @(
    "$env:COMPUTERNAME - Last Reboot $(Get-Date)",
    "test this",
    "and this one too"
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
)

Write-Block $messages -char '#'

---

################################################################################
# MyComputer - Last Reboot 09/24/2017 20:05:04                                 #
################################################################################
# test this                                                                    #
################################################################################
# and this one too                                                             #
################################################################################
# It is a long established fact that a reader will be distracted by the        #
# readable content of a page when looking at its layout. The point of using    #
# Lorem Ipsum is that it has a more-or-less normal distribution of letters,    #
# as opposed to using 'Content here, content here', making it look like        #
# readable English. Many desktop publishing packages and web page editors now  #
# use Lorem Ipsum as their default model text, and a search for 'lorem ipsum'  #
# will uncover many web sites still in their infancy. Various versions have    #
# evolved over the years, sometimes by accident, sometimes on purpose          #
# (injected humour and the like).                                              #
################################################################################
```