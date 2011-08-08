From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: RE: [PATCH 2/2] arm/tegra: Delete irq_to_gpio
Date: Mon, 8 Aug 2011 11:50:47 -0600
Message-ID: <CACxGe6ubndfYNxgRfrLtCZ8cP0FddwTpG_FBZKXVZb0OHJVt6w@mail.gmail.com>
References: <1312582534-10871-1-git-send-email-swarren@nvidia.com>
 <1312582534-10871-2-git-send-email-swarren@nvidia.com> <20110806174519.GB31966@ponder.secretlab.ca>
 <74CDBE0F657A3D45AFBB94109FB122FF049F172168@HQMAIL01.nvidia.com> <CAOesGMi2CXyAoy56-SdaD5YFzXW6W4wP6mnH+bVvRR3i_Mhk2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMi2CXyAoy56-SdaD5YFzXW6W4wP6mnH+bVvRR3i_Mhk2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Aug 8, 2011 8:26 AM, "Stephen Warren" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Grant Likely wrote at Saturday, August 06, 2011 11:45 AM:
> > On Fri, Aug 05, 2011 at 04:15:34PM -0600, Stephen Warren wrote:
> > > irq_to_gpio is deprecated and in the process of being removed. Ma=
ke that
> > > happen now for ARM Tegra.
> > >
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Applied both. =A0Thanks.
>
> Didn't you want an Ack by a Tegra maintainer first?

It looks like a pretty low risk change.=A0 I didn't see much risk in
picking it up and getting it off my plate.=A0 I can always pull things
back out of my tree if someone complains.  I'll add Olof's ack before
it gets into linux-next.

>
> I assume they were both applied to gpio-next (although a fresh fetch =
=A0of that
> doesn't show the commits)

I can't push it out until after 3.1-rc1 is released because it is
targeted at 3.2 now.

g.
