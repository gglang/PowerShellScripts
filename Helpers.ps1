function Get-Path { # This probably doesn't need to be a thing, and if it is a thing RootPath and FileName ought to be combined somehow
    param (
        [Parameter(Position=0,mandatory=$false)]
        [string] $RootPath = 'C:\',
        [Parameter(Position=1,mandatory=$true)]
        [string] $FileName,
        [Parameter(Position=2,mandatory=$false)]
        [switch] $Relative
    )

    process {
        if($Relative)
        {
            Get-ChildItem -Path C:\Dev\FlashFrancais\ -Filter "$($FileName)" -Recurse | Resolve-Path -Relative
        }
        else 
        {
            Get-ChildItem -Path C:\Dev\FlashFrancais\ -Filter "$($FileName)" -Recurse | Resolve-Path
        }
    }
}