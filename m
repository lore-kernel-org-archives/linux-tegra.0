From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] media: tegra: Make tegra210_video_formats static
Date: Mon, 11 May 2020 13:06:54 -0700
Message-ID: <095bb6a1-c4a0-1983-ac5e-701969aa3346@nvidia.com>
References: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1589196015-8945-1-git-send-email-zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Zou <zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 5/11/20 4:20 AM, Samuel Zou wrote:
> Fix the following sparse warning:
>
> drivers/staging/media/tegra-video/tegra210.c:589:33: warning: symbol 'tegra210_video_formats' was not declared.
>
> The tegra210_video_formats has only call site within tegra210.c
> It should be static
>
> Fixes: 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
> Reported-by: Hulk Robot<hulkci-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Samuel Zou<zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/staging/media/tegra-video/tegra210.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Acked-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
