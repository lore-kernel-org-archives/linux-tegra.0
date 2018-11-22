From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] soc/tegra: Fix terminating condition
Date: Thu, 22 Nov 2018 16:16:07 +0800
Message-ID: <CAEExFWuEQ3G-U_-MwovgKFwMGcX3xxdXkkxG1J-xCBNDuUWPCw@mail.gmail.com>
References: <20181122075244.3909-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122075244.3909-1-natechancellor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ndesaulniers@google.com
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 22, 2018 at 3:53 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> drivers/soc/tegra/common.c:27:16: error: address of array
> 'match->compatible' will always evaluate to 'true'
> [-Werror,-Wpointer-bool-conversion]
>         while (match->compatible) {
>         ~~~~~  ~~~~~~~^~~~~~~~~~
> 1 error generated.
>
> Whoops, we have an infinite loop and QEMU no longer boots...
>
> https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/1602429=
18
>
> Check that the first character of the string isn't null so that the loop
> properly terminates.
>
> Fixes: c57eff9503a5 ("soc/tegra: refactor soc_is_tegra()")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index 8a538b968fe9..54627ca957e8 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -24,7 +24,7 @@ bool soc_is_tegra(void)
>  {
>         const struct of_device_id *match =3D tegra_machine_match;
>
> -       while (match->compatible) {
> +       while (match->compatible[0]) {
How about this?
            while (*match->compatible) {
=EF=BC=9A-=EF=BC=89
Acked-by: Yangtao Li <tiny.windzz@gmail.com>
>                 if (of_machine_is_compatible(match->compatible))
>                         return true;
>
> --
> 2.20.0.rc1
>
