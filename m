From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] dt/bindings: Add 'nvidia,hd-no-invert' option
Date: Mon, 22 Feb 2016 12:48:52 -0700
Message-ID: <56CB6624.6030600@wwwdotorg.org>
References: <56C3977E.8050001@wwwdotorg.org>
 <1456122253-3039-1-git-send-email-sctincman@gmail.com>
 <1456122253-3039-2-git-send-email-sctincman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456122253-3039-2-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/21/2016 11:24 PM, Jonathan Tinkham wrote:
> Document an option to not invert the headphone detect GPIO signal
>

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt

>   Optional properties:
>   - nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
> +- nvidia,hd-no-invert : Do not invert headphone detect signal

We should use "hp" not "hd" to be consistent with other properties.

Why can't we use the GPIO specifier's ACTIVE_LOW/ACTIVE_HIGH flag to 
represent the polarity of this signal?
