From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] merge_config.sh: ignore unwanted grep errors
Date: Tue, 3 Sep 2019 23:35:22 +0900
Message-ID: <CAK7LNAS5eYnsuaZ2XxCb1HXmV=QqfgPZNz_E=Ad+CZnDdLdO8A@mail.gmail.com>
References: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@collabora.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 3, 2019 at 12:19 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> The merge_config.sh script verifies that all the config options have
> their expected value in the resulting file and prints any issues as
> warnings.  These checks aren't intended to be treated as errors given
> the current implementation.  However, since "set -e" was added, if the
> grep command to look for a config option does not find it the script
> will then abort prematurely.
>
> Handle the case where the grep exit status is non-zero by setting
> ACTUAL_VAL to an empty string to restore previous functionality.
>
> Fixes: cdfca821571d ("merge_config.sh: Check error codes from make")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied to linux-kbuild.
Thanks.



> Notes:
>     v2: use true rather than echo as per Jon Hunter's suggestion
>
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index d924c51d28b7..f2cc10b1d404 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -177,7 +177,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>  for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
>
>         REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> -       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> +       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || true)
>         if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>                 echo "Value requested for $CFG not in final .config"
>                 echo "Requested value:  $REQUESTED_VAL"
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
