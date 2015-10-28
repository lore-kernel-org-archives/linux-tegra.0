From: Tom Warren <TWarren@nvidia.com>
Subject: Re: [PATCH 0/4] ARM: tegra: GPU WPR region support
Date: Wed, 28 Oct 2015 15:44:08 +0000
Message-ID: <b2143f6e4b114bf2acf63cac1269687a@HQMAIL104.nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <CAAVeFuLENPfjy1k2ZTUArTph_6wbAxXninZ2Tmp6-MV4zVgaHw@mail.gmail.com>
 <caa39e0a12454046a1638aae190f0161@HQMAIL104.nvidia.com>
 <CAAVeFuKdUag3dqED9ViB0Nb3vicVVp7oayZ8Uv44Zv-osPWMig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAAVeFuKdUag3dqED9ViB0Nb3vicVVp7oayZ8Uv44Zv-osPWMig@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
List-Id: linux-tegra@vger.kernel.org

Alex,

> -----Original Message-----
> From: Alexandre Courbot [mailto:gnurou@gmail.com]
> Sent: Wednesday, October 28, 2015 2:13 AM
> To: Tom Warren <TWarren@nvidia.com>
> Cc: Alex Courbot <acourbot@nvidia.com>; Stephen Warren
> <swarren@nvidia.com>; Thierry Reding <treding@nvidia.com>; u-
> boot@lists.denx.de; linux-tegra@vger.kernel.org
> Subject: Re: [PATCH 0/4] ARM: tegra: GPU WPR region support
> 
> On Wed, Oct 28, 2015 at 12:57 AM, Tom Warren <TWarren@nvidia.com>
> wrote:
> > Sorry, Alex. Missed these.
> >
> >> -----Original Message-----
> >> From: Alexandre Courbot [mailto:gnurou@gmail.com]
> >> Sent: Sunday, October 25, 2015 10:50 PM
> >> To: Alex Courbot <acourbot@nvidia.com>
> >> Cc: Tom Warren <TWarren@nvidia.com>; Stephen Warren
> >> <swarren@nvidia.com>; Thierry Reding <treding@nvidia.com>; u-
> >> boot@lists.denx.de; linux-tegra@vger.kernel.org
> >> Subject: Re: [PATCH 0/4] ARM: tegra: GPU WPR region support
> >>
> >> Ping Tom, how does this look to you?
> > Looks pretty good, but what about saving the security_carveout reg settings
> back to the BCT or scratch regs so those settings will be restored on LP0
> resume?
> 
> Absolutely - I am not familiar at all with BCT or scratch registers (and U-boot in
> general :) ) though, could you point me to some part of the code which I could
> use as a reference for this?
> 
> Also, how can I decide which mechanism to use over the other?
I'll have to refresh my meat RAM on how U-Boot handles LP0 WRT BCT/scratch regs, but in coreboot I had to 'flush' the updated carveout regs back to the BCT copy in SDRAM so that they'd be properly restored on resume. I only pushed the modified regs (BOM and CFG0, IIRC).  If you have access to Google's coreboot repo, look in src/soc/nvidia/tegra210/sdram_lp0.c, commit ID 920968258. Or just Google for sdram_lp0.c, should be the top hit.

> 
> Thanks,
> Alex.
