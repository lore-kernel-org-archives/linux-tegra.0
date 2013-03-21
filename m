From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH REPOST 2] drm: tegra: don't depend on OF
Date: Thu, 21 Mar 2013 13:03:35 -0600
Message-ID: <514B5987.4040704@wwwdotorg.org>
References: <1363888630-30197-1-git-send-email-swarren@wwwdotorg.org> <CAF6AEGs0Sw=-xGv9+Aq6xnTktE3R4xcGPokVpmjqEAC1uOct8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF6AEGs0Sw=-xGv9+Aq6xnTktE3R4xcGPokVpmjqEAC1uOct8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 01:02 PM, Rob Clark wrote:
> How far away are we from supporting tegradrm with ARCH_MULTIPLATFORM?
> It would be nice to be able to at least compile-test drm core changes
> with all the arm drivers in one shot..

Pretty close. It might happen in 3.10 if I get time, otherwise it should
happen for 3.11.
