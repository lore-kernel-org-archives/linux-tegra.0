From: Nicolas Chauvet <kwizart@gmail.com>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Thu, 19 Mar 2020 08:55:38 +0100
Message-ID: <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
References: <20200319074401.GA4116@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200319074401.GA4116@Red>
Sender: linux-clk-owner@vger.kernel.org
To: LABBE Corentin <clabbe@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, pdeschrijver@nvidia.com, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, axboe@kernel.dk, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-ide@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Le jeu. 19 mars 2020 =C3=A0 08:44, LABBE Corentin <clabbe@baylibre.com> a =
=C3=A9crit :
>
> Hello
>
> sata doesnt work on tegra124-jetson-tk1 on next and master and at least s=
ince 5.2 (but 5.1 works).
> [    0.492810] +5V_SATA: supplied by +5V_SYS
> [    0.493230] +12V_SATA: supplied by +VDD_MUX
> [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not fo=
und, using dummy regulator
> [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not fou=
nd, using dummy regulator
> [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not fo=
und, using dummy regulator
> [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not fou=
nd, using dummy regulator
> [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not fo=
und, using dummy regulator
> [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not fou=
nd, using dummy regulator
> [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not =
found, using dummy regulator
> [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controll=
er: -110
> [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> [   35.694269] +5V_SATA: disabling
> [   35.697438] +12V_SATA: disabling

It looks strange, because (on same device) , I have sata working as
appropriate, but ethernet fails with me.
https://bugzilla.kernel.org/show_bug.cgi?id=3D206217

It might worth to have another report.

--=20
-

Nicolas (kwizart)
