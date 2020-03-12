From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] sdhci: tegra: Implement Tegra specific set_timeout callback
Date: Thu, 12 Mar 2020 16:35:41 +0100
Message-ID: <CAPDyKFoJvaCj=wkV_ok=sLJK18ukf1UavCvDN-E_oFVkpwPbmw@mail.gmail.com>
References: <1583886030-11339-1-git-send-email-skomatineni@nvidia.com>
 <CAPDyKFpAgk0uboGXdmA_m1-2=GK2oRXVv+97ZFFFAtT-ZZo4fw@mail.gmail.com> <7bf5bfb5-b07c-96d3-2c33-124085a36a65@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7bf5bfb5-b07c-96d3-2c33-124085a36a65-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Bradley Bolen <bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aniruddha Tvs Rao <anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 12 Mar 2020 at 16:28, Sowjanya Komatineni
<skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 3/12/20 6:08 AM, Ulf Hansson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > -trimmed cc list
> >
> > On Thu, 12 Mar 2020 at 00:51, Sowjanya Komatineni
> > <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> Tegra host supports HW busy detection and timeouts based on the
> >> count programmed in SDHCI_TIMEOUT_CONTROL register and max busy
> >> timeout it supports is 11s in finite busy wait mode.
> >>
> >> Some operations like SLEEP_AWAKE, ERASE and flush cache through
> >> SWITCH commands take longer than 11s and Tegra host supports
> >> infinite HW busy wait mode where HW waits forever till the card
> >> is busy without HW timeout.
> >>
> >> This patch implements Tegra specific set_timeout sdhci_ops to allow
> >> switching between finite and infinite HW busy detection wait modes
> >> based on the device command expected operation time.
> >>
> >> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Applied for next, thanks!
> >
> > We should probably tag this for stable as well, don't you think?
> >
> > Kind regards
> > Uffe
>
> Yes, we need this for stable as well. As this is applied for next, looks
> like can't re-send patch with tag.
>
> Can you please help to add tag if you don't mind?

Yes, I will amend the change to add the stable tag, no worries!

Thanks for confirming!

[...]

Kind regards
Uffe
