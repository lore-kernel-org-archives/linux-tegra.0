From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: tegra: Remove redundant initialisation
 of compat_filter_fn
Date: Tue, 22 Oct 2013 13:40:18 +0200
Message-ID: <52666422.9010505@metafoo.de>
References: <1382188623-19494-1-git-send-email-broonie@kernel.org> <52644D3C.9020709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52644D3C.9020709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/20/2013 11:38 PM, Stephen Warren wrote:
> On 10/19/2013 02:17 PM, Mark Brown wrote:
>> From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Setting a field in a static struct to NULL has no effect so don't bother
>> (and don't generate false positives for grep).
> 
> I'm fine with this either way, so feel free to take my ack whichever way
> you work this out with Lars-Peter.

I don't care that much either, just wanted to give an explanation why things
are the way they are. Mark, if you want to merge this patch you can add:
Acked-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>

Btw. wasn't there a plan to move tegra to the generic dma bindings? If not I
think it might be a good idea to add the possibility to let the DMA  driver
overwrite the DT attribute parsing done by of_dma_match_channel(). This
would spare drivers from having to do the parsing manually and it would
allow the tegra pcm driver to just follow the normal OF path in the
generic-dmaengine-pcm driver and didn't had to rely on the compat path.

- Lars
