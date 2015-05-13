From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Support TPM on nyan boards
Date: Wed, 13 May 2015 08:30:25 -0600
Message-ID: <55536001.6080901@wwwdotorg.org>
References: <1431526194-11744-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431526194-11744-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/13/2015 08:09 AM, Simon Glass wrote:
> There is a TPM on I2C3, so set up the pinmux for that.

[Dropping LKML; they won't have a clue what this patch is about since 
it's not an in-kernel tool. Adding linux-tegra mailing list since that's 
where these patches are usually sent. Hence, maintaining quote of the 
entire patch.]

This looks reasonable. I'll apply it Friday assuming no objections from 
anyone (I know some people in Europe are on holiday Thursday and likely 
left already today).

> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>
>   configs/nyan-big.board   | 4 ++--
>   configs/nyan-blaze.board | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/configs/nyan-big.board b/configs/nyan-big.board
> index 6ebe466..18c2e52 100644
> --- a/configs/nyan-big.board
> +++ b/configs/nyan-big.board
> @@ -40,8 +40,8 @@ pins = (
>       ('ulpi_dir_py1',           'spi1',        None,      'none', False, True,  False, False),
>       ('ulpi_nxt_py2',           'spi1',        None,      'none', False, False, False, False),
>       ('ulpi_stp_py3',           'spi1',        None,      'none', False, False, False, False),
> -    ('cam_i2c_scl_pbb1',       'rsvd3',       None,      'down', True,  False, False, False),
> -    ('cam_i2c_sda_pbb2',       'rsvd3',       None,      'down', True,  False, False, False),
> +    ('cam_i2c_scl_pbb1',       'i2c3',        None,      'none', False, True,  True,  False),
> +    ('cam_i2c_sda_pbb2',       'i2c3',        None,      'none', False, True,  True,  False),
>       ('cam_mclk_pcc0',          'vi',          None,      'down', True,  False, False, False),
>       ('pbb0',                   'vgp6',        None,      'down', True,  False, False, False),
>       ('pbb3',                   'vgp3',        None,      'down', True,  False, False, False),
> diff --git a/configs/nyan-blaze.board b/configs/nyan-blaze.board
> index 39a2022..eee472f 100644
> --- a/configs/nyan-blaze.board
> +++ b/configs/nyan-blaze.board
> @@ -40,8 +40,8 @@ pins = (
>       ('ulpi_dir_py1',           'spi1',        None,      'none', False, True,  False, False),
>       ('ulpi_nxt_py2',           'spi1',        None,      'none', False, False, False, False),
>       ('ulpi_stp_py3',           'spi1',        None,      'none', False, False, False, False),
> -    ('cam_i2c_scl_pbb1',       'rsvd3',       None,      'down', True,  False, False, False),
> -    ('cam_i2c_sda_pbb2',       'rsvd3',       None,      'down', True,  False, False, False),
> +    ('cam_i2c_scl_pbb1',       'i2c3',        None,      'none', False, True,  True,  False),
> +    ('cam_i2c_sda_pbb2',       'i2c3',        None,      'none', False, True,  True,  False),
>       ('cam_mclk_pcc0',          'vi',          None,      'down', True,  False, False, False),
>       ('pbb0',                   'vgp6',        None,      'down', True,  False, False, False),
>       ('pbb3',                   'vgp3',        None,      'down', True,  False, False, False),
>
