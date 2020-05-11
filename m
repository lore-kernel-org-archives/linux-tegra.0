From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: correct path in TEGRA VIDEO DRIVER
Date: Mon, 11 May 2020 12:44:11 -0700
Message-ID: <00ec3aa4-07c5-49ed-df89-de3f7f8b8cd8@nvidia.com>
References: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200511192844.11044-1-lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Bulwahn <lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hverkuil-cisco-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 5/11/20 12:28 PM, Lukas Bulwahn wrote:
> Commit 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver") added
> the driver to drivers/staging/media/tegra-video/, but commit 2c6b617f2cca
> ("MAINTAINERS: Add Tegra Video driver section") added a file entry
> referring to drivers/staging/media/tegra/.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>    warning: no file matches  F:  drivers/staging/media/tegra/
>
> Adjust the file entry in TEGRA VIDEO DRIVER to the correct path.
>
> Signed-off-by: Lukas Bulwahn<lukas.bulwahn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Sowjanya, please ack this minor patch.
>
> applies cleanly on next-20200511
>
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Acked-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
