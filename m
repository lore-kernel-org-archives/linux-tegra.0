From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: tegra-wm8903: Document new
 nvidia,headset property
Date: Fri, 10 Apr 2020 12:44:11 -0500
Message-ID: <20200410174411.GA21788@bogus>
References: <20200330204011.18465-1-digetx@gmail.com>
 <20200330204011.18465-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200330204011.18465-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 30 Mar 2020 23:40:10 +0300, Dmitry Osipenko wrote:
> Some devices have a 4-pin headset jack instead of 3-pin microphone jack.
> The new boolean nvidia,headset property tells that the Mic Jack represents
> the state of a headset microphone. This additional hardware description is
> needed because microphone detection procedure differs in a case of a 4-pin
> jack from a 3-pin jack.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
