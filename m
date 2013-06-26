From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra-ac97: Do common and clock init prior to component
 registration
Date: Wed, 26 Jun 2013 11:27:15 -0600
Message-ID: <51CB2473.5070606@wwwdotorg.org>
References: <1372246111-15781-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372246111-15781-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2013 05:28 AM, Mark Brown wrote:
> From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Otherwise we may instantiate and hence have something try to access the
> device while it is still completing initialisation.

One question below, otherwise,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
>  err_clk_put:
>  err:
>  	return ret;

Right after the err_clk_put label there's a clk_put(ac97->clk_ac97) in
my copy, and in the ASoC for-next branch. When did that get removed?
