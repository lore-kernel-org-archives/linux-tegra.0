From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] merge_config.sh: Check error codes from make
Date: Mon, 2 Sep 2019 15:06:28 +0100
Message-ID: <b744485d-3e57-469f-5573-6d8a32ba0aef@nvidia.com>
References: <20190819200650.18156-1-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819200650.18156-1-broonie@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 19/08/2019 21:06, Mark Brown wrote:
> When we execute make after merging the configurations we ignore any
> errors it produces causing whatever is running merge_config.sh to be
> unaware of any failures.  This issue was noticed by Guillaume Tucker
> while looking at problems with testing of clang only builds in KernelCI
> which caused Kbuild to be unable to find a working host compiler.
> 
> This implementation was suggested by Yamada-san.
> 
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

I have noticed some recent build failures on -next and the bisect is 
pointing to this commit. I have been looking at why this commit is 
making the builds fail and I see a few different things going on ...

1. By using 'set -e', if grep fails to find a kconfig option in the   
   resulting config file, then script exits silently without reporting 
   which option it failed to find. Hence, it is unclear what triggered 
   the failure. This may happen when options are being disabled.

2. If an option is disabled by the config fragment that happens to be a 
   parent of other kconfig options, then although the parent and 
   children are disabled correctly, the script may fail because it no 
   longer finds the children in the resulting config file. A specific 
   example, here is CONFIG_NFS_V4. We disable this option due to 
   issues with some host machines we use, and disabling this also 
   disables CONFIG_NFS_V4_1 and CONFIG_NFS_V4_2. Now if all 3 of these 
   options are enabled by default in the base config file, such as the 
   case in the ARM64 defconfig, then disabling CONFIG_NFS_V4 in the 
   config fragment causes merge_config.sh to fail because  
   CONFIG_NFS_V4_1 and CONFIG_NFS_V4_2 are not defined at all in 
   the resulting config. This causes grep to fail to find these and 
   hence causes the script to terminate. In the resulting config file we 
   just have '# CONFIG_NFS_V4 is not set'. I am not sure if there is an 
   easy way to determine if a missing config option is legitimate or 
   not. 

A simple way to test the above is ...

 $ export ARCH=arm64
 $ echo "CONFIG_NFS_V4=n" > kfrag                                                                                                                                                   
 $ ./scripts/kconfig/merge_config.sh arch/arm64/configs/defconfig kfrag 

If the intent is to catch errors returned by make, then one simple fix would be ...

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index bec246719aea..63c8565206a4 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -179,7 +179,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 
        REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
+       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || true)
        if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
                echo "Value requested for $CFG not in final .config"
                echo "Requested value:  $REQUESTED_VAL"


I have been using merge_config.sh to enable and disable various options
we need for testing for sometime now and so would hope I am not doing
anything out of the ordinary here. 

Let me know your thoughts.

Cheers
Jon

-- 
nvpublic
