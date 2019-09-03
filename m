From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] merge_config.sh: ignore unwanted grep errors
Date: Tue, 3 Sep 2019 11:10:36 +0100
Message-ID: <3f5df041-ae53-8719-41f4-7b56a49a8bbc@nvidia.com>
References: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/09/2019 16:18, Guillaume Tucker wrote:
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
> 
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
>  	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> -	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> +	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || true)
>  	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>  		echo "Value requested for $CFG not in final .config"
>  		echo "Requested value:  $REQUESTED_VAL"
> 

Thanks for fixing! Great if we could get this into -next as soon as
possible!

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
