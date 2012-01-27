From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v1 1/8] ARM: tegra: introduce support for reading chipid
Date: Fri, 27 Jan 2012 00:19:12 -0800
Message-ID: <20120127081912.GA13387@quad.lixom.net>
References: <1327597641-7519-1-git-send-email-pdeschrijver@nvidia.com>
 <1327597641-7519-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327597641-7519-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Jan 26, 2012 at 07:07:06PM +0200, Peter De Schrijver wrote:
> Introduce a function to read the Tegra chipid. This will be used by the SMP
> code to distinguish between Tegra variants.
> 
> ---
> 
> Should this be merged with the fuse reading code even though this is a
> hardwired register, not a fuse based register?

Well, it's part of a register that the fuse code already reads, i.e. in
tegra_get_revision(). I'd say add it there instead of create a separate
file for it.

There's actually an opencoded version of this in that very function
already that can be cleaned up at the same time (to check for A03p vs
A03 revisions).


-Olof
