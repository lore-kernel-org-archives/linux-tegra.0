From: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Wed, 25 Mar 2020 15:23:06 +0100
Message-ID: <20200325142306.GB27961@Red>
References: <20200319074401.GA4116@Red>
 <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
 <20200325134003.GA27961@Red>
 <cf63d40c-7b84-60f6-76be-a13255e69c99@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cf63d40c-7b84-60f6-76be-a13255e69c99@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Nicolas Chauvet <kwizart@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, pdeschrijver@nvidia.com, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, axboe@kernel.dk, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-ide@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 25, 2020 at 02:00:25PM +0000, Jon Hunter wrote:
> 
> On 25/03/2020 13:40, LABBE Corentin wrote:
> > On Thu, Mar 19, 2020 at 08:55:38AM +0100, Nicolas Chauvet wrote:
> >> Le jeu. 19 mars 2020 à 08:44, LABBE Corentin <clabbe@baylibre.com> a écrit :
> >>>
> >>> Hello
> >>>
> >>> sata doesnt work on tegra124-jetson-tk1 on next and master and at least since 5.2 (but 5.1 works).
> >>> [    0.492810] +5V_SATA: supplied by +5V_SYS
> >>> [    0.493230] +12V_SATA: supplied by +VDD_MUX
> >>> [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> >>> [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> >>> [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> >>> [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> >>> [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> >>> [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> >>> [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not found, using dummy regulator
> >>> [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> >>> [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
> >>> [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> >>> [   35.694269] +5V_SATA: disabling
> >>> [   35.697438] +12V_SATA: disabling
> >>
> >> It looks strange, because (on same device) , I have sata working as
> >> appropriate, but ethernet fails with me.
> >> https://bugzilla.kernel.org/show_bug.cgi?id=206217
> >>
> >> It might worth to have another report.
> >>
> > 
> > Hello
> > 
> > Mine has ethernet works well. But I hit many problem with it and older kernel.
> > Perhaps the 5.1.21, were I am stuck, does not have it.
> > 
> > Anyway, the tegra of kerneci has the same SATA problem.
> > https://storage.kernelci.org/next/master/next-20200325/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-baylibre/boot-tegra124-jetson-tk1.txt
> > 
> > Maintainers, any idea on this sata issue ?
> 
> I have checked our bootlogs for v5.6-rc7 and don't see the issue with
> either the tegra_defconfig or the multi_v7_defconfig. I am wondering if
> this could be due a difference in the bootloader version. Currently we
> are testing with a v2019.07 u-boot bootloader. Looks like the kernelci
> board is using an older u-boot. Obviously it should still work, but
> would be good to know if the reason why were are not seeing this is
> because of the bootloader.
> 
> Another thing to check would be the pll_e clock frequency on a working
> build and non-working build to see if there is a difference in the pll
> frequency that is causing this.
> 
> Cheers
> Jon
> 

Hello

My uboot is 2016.01-rc4-00002-g3861d78, so a bit old.
I have a mainline uboot build for this tegra, but still didnt find a clear way to update it.
Did you have a good documentation on how to update it ?
If possible some clear uboot commands to update it via tftp.

Thanks
Regards
