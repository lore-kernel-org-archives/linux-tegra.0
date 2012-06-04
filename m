From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dt: tegra{20,30}.dtsi: Rename "mc" to "memory-controller"
Date: Mon, 04 Jun 2012 11:28:10 -0600
Message-ID: <4FCCF02A.7060704@wwwdotorg.org>
References: <CAOesGMhw5hJSF96FBuENnwx2=ACyAYwX6uny9zQeTsimcebF8A@mail.gmail.com> <1337233667-23770-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337233667-23770-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/16/2012 11:47 PM, Hiroshi DOYU wrote:
> Use a more plain english name.

Applied the series for 3.6, with a minor fixup to revert the addition of
the redundant unit address on the Tegra30 memory-controller node, since
there's only 1 node of that name there for now.
