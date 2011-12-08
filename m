From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V3] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Wed, 7 Dec 2011 21:25:53 -0800
Message-ID: <20111208052553.GA30037@quad.lixom.net>
References: <1322616559-31941-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322616559-31941-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 29, 2011 at 06:29:19PM -0700, Stephen Warren wrote:
> From: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert tegra20 IRQ intialization to the GIC devicetree binding. Modify the
> interrupt definitions in the dts files according to
> Documentation/devicetree/bindings/arm/gic.txt
> 
> v3 (swarren):
> * Moved of_irq_init() call into board-dt.c to avoid ifdef'ing it.
>   - Even with a dummy replacement if !CONFIG_OF, the reference from
>     tegra_dt_irq_match[] to gic_of_init() would still have to be ifdef'd
>   - It's plausible that tegra_dt_irq_match[] may need to contain more
>     entries in the future, and defining what they are seems more suitable
>     for board-dt.c than irq.c
> v2 (swarren):
> * Removed some stale GIC init code from board-dt.c
> * Undid some accidental 0x -> 0x0 search/replace.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied with minor fixup since Marc's rework of the irq code isn't in my
branch; the resulting merge conflict is trivial to fix up.

I applied this to for-3.3/dt (see separate email about branch changes).


-Olof
