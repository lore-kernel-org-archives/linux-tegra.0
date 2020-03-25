From: LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Wed, 25 Mar 2020 14:40:03 +0100
Message-ID: <20200325134003.GA27961@Red>
References: <20200319074401.GA4116@Red>
 <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ide-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 08:55:38AM +0100, Nicolas Chauvet wrote:
> Le jeu. 19 mars 2020 à 08:44, LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> a écrit :
> >
> > Hello
> >
> > sata doesnt work on tegra124-jetson-tk1 on next and master and at least since 5.2 (but 5.1 works).
> > [    0.492810] +5V_SATA: supplied by +5V_SYS
> > [    0.493230] +12V_SATA: supplied by +VDD_MUX
> > [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> > [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> > [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> > [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> > [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> > [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> > [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not found, using dummy regulator
> > [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> > [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
> > [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> > [   35.694269] +5V_SATA: disabling
> > [   35.697438] +12V_SATA: disabling
> 
> It looks strange, because (on same device) , I have sata working as
> appropriate, but ethernet fails with me.
> https://bugzilla.kernel.org/show_bug.cgi?id=206217
> 
> It might worth to have another report.
> 

Hello

Mine has ethernet works well. But I hit many problem with it and older kernel.
Perhaps the 5.1.21, were I am stuck, does not have it.

Anyway, the tegra of kerneci has the same SATA problem.
https://storage.kernelci.org/next/master/next-20200325/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-baylibre/boot-tegra124-jetson-tk1.txt

Maintainers, any idea on this sata issue ?

Regards
