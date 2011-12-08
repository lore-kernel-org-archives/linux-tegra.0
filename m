From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ASoC: WM8903: Fix platform data gpio_cfg
	confusion
Date: Thu, 8 Dec 2011 00:41:23 +0000
Message-ID: <20111208004123.GB5748@opensource.wolfsonmicro.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com> <1322863721-29793-2-git-send-email-swarren@nvidia.com> <20111207234927.GA12676@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111207234927.GA12676-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 07, 2011 at 03:49:27PM -0800, Olof Johansson wrote:
> On Fri, Dec 02, 2011 at 03:08:37PM -0700, Stephen Warren wrote:

> > Olof, Colin, could you please ack this so that Mark can apply it to the
> > ASoC tree even though it touches Tegra code? Thanks.

> Mark, since Stephen is a tegra maintainer, there's no real need to have an
> explicit ack from one of the others, IMHO. But here you have it. :)

> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Too late, I already applied :)  Even if Stephen weren't a maintainer I'd
probably have gone aheady anyway as it's a trivial platform data change.
