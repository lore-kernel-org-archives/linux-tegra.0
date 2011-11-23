From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [alsa-devel] [PATCH v2 2/3] ASoC: Tegra+WM903 machine: Set the
 new fully_routed flag
Date: Wed, 23 Nov 2011 13:56:14 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C81E@HQMAIL01.nvidia.com>
References: <1322077326-5538-1-git-send-email-swarren@nvidia.com>
 <1322077326-5538-2-git-send-email-swarren@nvidia.com>
 <20111123213220.GA8149@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111123213220.GA8149-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Wednesday, November 23, 2011 2:32 PM:
> On Wed, Nov 23, 2011 at 12:42:05PM -0700, Stephen Warren wrote:
> 
> > v2: Rename flag from auto_nc_pins to fully_routed. Adjust description.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  sound/soc/tegra/tegra_wm8903.c |   22 +---------------------
> >  1 files changed, 1 insertions(+), 21 deletions(-)
> 
> Things like your above "v2" line really ought to go here below the ---
> so they're automatically cut from the changelog by the tools.

That was deliberate; some advantages:
* Documents the review process in git, potentially giving some insight
  into reasoning behind parts of the patch.
* Allows confirmation that the correct version was checked in.
  (rarely an issue, but occasionally, albeit I haven't seen it in ASoC)

It's been mentioned a couple of times briefly on various lists before,
and while I'm sure it's not standard practice or anything, at least
there are some people supporting it. However, if you prefer, I'll try
to remember to move the changelog for ASoC patches.

-- 
nvpublic
