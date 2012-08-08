From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: more regulator fixes for Harmony
Date: Wed, 08 Aug 2012 16:44:16 -0600
Message-ID: <5022EBC0.5060102@wwwdotorg.org>
References: <1344037521-6157-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344037521-6157-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/03/2012 05:45 PM, Stephen Warren wrote:
> Commit 3d55c29 "ARM: tegra: harmony: add regulator supply name and its
> input supply" was supposed to fix all the problems with regulators on
> Harmony. However, it appears that I only tested it when booting using
> board files, not when booting using device tree. This change fixes two
> problems with regulators when booting using device tree:
> 
> 1) That patch only created the vdd_sys regulator when booting using a
>    board file. Since this is the root of the whole regulator tree, this
>    caused no regulators to successfully initialize when booting using
>    device tree. The registration of vdd_sys is moved to fix this.
> 
> 2) When booting use DT, the regulator core sets has_full_constraints,
>    which in turn causes the core to turn off any regulators not marked
>    as always on. Some of the affected regulators are required for basic
>    system operation. To solve this, add always on constraints to all
>    relevant regulators. This doesn't affect booting using a board file
>    since nothing sets has_full_constraints in that case.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is a fix for v3.6.

Arnd, Olof, I don't see this in the arm-soc fixes tree, although do see
you've applied a bunch of patches since I posted this. Did it drop
through the cracks?
