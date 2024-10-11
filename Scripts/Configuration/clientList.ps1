# Get the parent directory of the script's location
$findparentFolder = Split-Path -Path $PSScriptRoot -Parent
$parentFolder = Split-Path -Path $findparentFolder -Parent

# Define a nested hashtable to store client site agents and installation flags
$clientSiteList = @{
    "Diaverum Facilities Management Limited"           = @{
        "Head Office"                                                                                  = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\HeadOffice\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Aston Cross"                                                                                  = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\AstonCross\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Bedford"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Bedford\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Colchester"                                                                                   = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Colchester\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Crawley"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Crawley\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Eastbourne"                                                                                   = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Eastbourne\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Great Bridge"                                                                                 = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\GreatBridge\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Hereford"                                                                                     = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Hereford\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Kings Norton"                                                                                 = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\KingsNorton\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Lewisham Training Centre (decommissioned end May 2021 and no longer on support. ADT remains)" = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\LewishamTrainingCentre\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Nottingham"                                                                                   = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Nottingham\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Redditch"                                                                                     = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Redditch\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Rotherham"                                                                                    = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Rotherham\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Sidcup"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Sidcup\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Stockton"                                                                                     = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Stockton\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Thamesmead"                                                                                   = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Thamesmead\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Walsall"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Walsall\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Aldeburgh"                                                                                    = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Aldeburgh\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Clacton"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Clacton\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Ipswich"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Ipswich\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Lewisham"                                                                                     = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Lewisham\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Harlow"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Harlow\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Norwich"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Norwich\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "New Cross Gate"                                                                               = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\NewCrossGate\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Havant"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Havant\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Salisbury"                                                                                    = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Salisbury\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Blackburn"                                                                                    = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Blackburn\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Furness"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Furness\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Burnley"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Burnley\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Kendal"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Kendal\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Tunbridge Wells"                                                                              = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\TunbridgeWells\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Borough"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Borough\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Cromer"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Cromer\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Diaverum - USED Stock at ILUX"                                                                = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\USEDStockatILUX\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "North Ormesby"                                                                                = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\NorthOrmesby\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Darlington"                                                                                   = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Darlington\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Diaverum - NEW Stock at ILUX"                                                                 = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\NEWStockatILUX\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Woodgate"                                                                                     = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Woodgate\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Somers Place"                                                                                 = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\SomersPlace\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Langham Ward"                                                                                 = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\LanghamWard\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Langley Ward"                                                                                 = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\LangleyWard\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Cotswold"                                                                                     = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Cotswold\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Severn"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Severn\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Ward 7B"                                                                                      = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Ward7B\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Forest"                                                                                       = @{
            "Agent"               = "$parentFolder\Agents\DiaverumFacilitiesManagementLimited\Forest\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Mark Ironside Plumbing & Heating"                 = @{
        "Fenland House" = @{
            "Agent"               = "$parentFolder\Agents\MarkIronsidePlumbingHeating\FenlandHouse\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Driver Development Programme"                     = @{
        "Newton Hall" = @{
            "Agent"               = "$parentFolder\Agents\DriverDevelopmentProgramme\NewtonHall\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Diaverum UK"                                      = @{
        "St Albans (Head Office)" = @{
            "Agent"               = "$parentFolder\Agents\DiaverumUK\StAlbansHeadOffice\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Adams Harrison"                                   = @{
        "Saffron Walden (Head Office)" = @{
            "Agent"               = "$parentFolder\Agents\AdamsHarrison\SaffronWaldenHeadOffice\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Haverhill"                    = @{
            "Agent"               = "$parentFolder\Agents\AdamsHarrison\Haverhill\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Sawston"                      = @{
            "Agent"               = "$parentFolder\Agents\AdamsHarrison\Sawston\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Glulam Timber Engineering Limited"                = @{
        "Main" = @{
            "Agent"               = "$parentFolder\Agents\GlulamTimberEngineeringLimited\Main\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Premier Chemicals Limited"                        = @{
        "Houghton Hill" = @{
            "Agent"               = "$parentFolder\Agents\PremierChemicalsLimited\HoughtonHill\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Garden Furniture Global Ltd"                      = @{
        "Main" = @{
            "Agent"               = "$parentFolder\Agents\GardenFurnitureGlobalLtd\Main\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Anglia CNC Engineering Limited"                   = @{
        "Unit 4 Anglia Works" = @{
            "Agent"               = "$parentFolder\Agents\AngliaCNCEngineeringLimited\Unit4AngliaWorks\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Jigsaw Media & Communications"                    = @{
        "2 Cameron Green" = @{
            "Agent"               = "$parentFolder\Agents\JigsawMediaCommunications\2CameronGreen\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Promed Limited"                                   = @{
        "Unit 15 West Newlands Industrial Park" = @{
            "Agent"               = "$parentFolder\Agents\PromedLimited\Unit15WestNewlandsIndustrialPark\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Tony Mcfadden"                                    = @{
        "Hatfield" = @{
            "Agent"               = "$parentFolder\Agents\TonyMcFadden\Hatfield\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $False
            "InstallSupportAgent" = $true
        }
    }
    "CMRR Limited"                                     = @{
        "Knapwell Wood Farm" = @{
            "Agent"               = "$parentFolder\Agents\CMRRLimited\KnapwellWoodFarm\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Croslaw Direct"                                   = @{
        "Holmfirth" = @{
            "Agent"               = "$parentFolder\Agents\CroslawDirect\Holmfirth\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "Grant Hayes"                                      = @{
        "Otterbush Farm" = @{
            "Agent"               = "$parentFolder\Agents\GrantHayes\OtterbushFarm\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
    "CVS (UK) Limited t/a Insight Laboratory Services" = @{
        "Andrew Bufton Home Office" = @{
            "Agent"               = "$parentFolder\Agents\CVSUKLimitedtInsightLaboratoryServices\AndrewBuftonHomeOffice\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Hereford"                  = @{
            "Agent"               = "$parentFolder\Agents\CVSUKLimitedtInsightLaboratoryServices\Hereford\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Shrewsbury"                = @{
            "Agent"               = "$parentFolder\Agents\CVSUKLimitedtInsightLaboratoryServices\Shrewsbury\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Rampton"                   = @{
            "Agent"               = "$parentFolder\Agents\CVSUKLimitedtInsightLaboratoryServices\Rampton\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Metheringham Unit 15B"     = @{
            "Agent"               = "$parentFolder\Agents\CVSUKLimitedtInsightLaboratoryServices\MetheringhamUnit15B\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
        "Metheringham Unit 28"      = @{
            "Agent"               = "$parentFolder\Agents\CVSUKLimitedtInsightLaboratoryServices\MetheringhamUnit28\Agent.exe"
            "InstallChrome"       = $true
            "InstallAdobeReader"  = $true
            "InstallOffice"       = $true
            "InstallSlack"        = $true
            "InstallSupportAgent" = $true
        }
    }
}