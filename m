From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ASoC: Allow device tree to specify a card's name
Date: Wed, 7 Dec 2011 15:58:18 -0800
Message-ID: <20111207235818.GB12945@quad.lixom.net>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
 <1323296033-28730-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323296033-28730-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 07, 2011 at 03:13:41PM -0700, Stephen Warren wrote:
> If a card's device was instantiated from device tree, and the device tree
> has a "user-visible-name" property, use that as the card's name.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: New patch implementing new functionality
> 
> Re: the binding documentation:
> * "SoC" here refers to the fact this is a binding oriented at System-on-
>   chip audio complexes, rather than having to do with "ASoC"; both names
>   were derived from the same root.
> * Do we need a compatible property for this "base class" binding at all?
>   I think it's a good idea, even though the code doesn't actually rely
>   on it.
> * Should the vendor field in the compatible property be "generic",
>   "linux", or absent? I've tried to make these bindings generic and
>   applicable to other OSs, so "linux," seems wrong.

Just drop "generic," in my opinion. Rob? Grant? Segher? 

> * Should the property "user-visible-name" have a "generic," prefix or
>   similar?

The root node uses "model" for the same purpose, to describe the machine
model with a user-visible string. Maybe just use that name here?


-Olof
