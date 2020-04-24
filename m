From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5.4.33 0/2] Fix for long operation cmds busy detection
Date: Fri, 24 Apr 2020 09:23:46 +0200
Message-ID: <CAPDyKFo0vx1=_j5M-X068n8Xp3wU9JVrXkADCDcGX0Q1oRBzRg@mail.gmail.com>
References: <1587573149-30269-1-git-send-email-skomatineni@nvidia.com>
 <20200423064755.GA3491005@kroah.com> <fe49d36f-65c9-736f-791c-27c602cc3bb8@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe49d36f-65c9-736f-791c-27c602cc3bb8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "(Exiting) Baolin Wang" <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Bradley Bolen <bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aniruddha Tvs Rao <anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 23 Apr 2020 at 17:38, Sowjanya Komatineni
<skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 4/22/20 11:47 PM, Greg KH wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Wed, Apr 22, 2020 at 09:32:27AM -0700, Sowjanya Komatineni wrote:
> >> This series is to backport the upstream patches that fixes busy detection
> >> for long operation mmc commands by implementing Tegra specific timeout
> >> callback to switch between finite and infinite HW busy detection wait
> >> modes.
> >>
> >>
> >> Sowjanya Komatineni (2):
> >>    sdhci: tegra: Implement Tegra specific set_timeout callback
> >>    sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability
> >>
> >>   drivers/mmc/host/sdhci-tegra.c | 33 +++++++++++++++++++++++++++++++++
> >>   1 file changed, 33 insertions(+)
> > Any specific reason you did not cc: the stable@vger list when asking for
> > stable patches to be merged?
>
> I added Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> in Signed-off area of patches

I think Greg meant you actually need to send manually backported
patches to stable-u79uwXL29TaiAVqoAR/hOA@public.gmane.org This helps Greg and Sasha to pick
them up.

Kind regards
Uffe
