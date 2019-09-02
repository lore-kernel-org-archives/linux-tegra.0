From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/1] merge_config.sh: ignore unwanted grep errors
Date: Mon, 2 Sep 2019 15:21:04 +0100
Message-ID: <a302a6fe-8f22-9ae6-559f-5b2ad13d5b05@nvidia.com>
References: <4f92e9b3a88e60c8b5962504d77bc596442b0a40.1567023309.git.guillaume.tucker@collabora.com>
 <b1dc3c40-b658-211e-811c-e13083303d48@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1dc3c40-b658-211e-811c-e13083303d48@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 02/09/2019 15:14, Guillaume Tucker wrote:
> + Jon Hunter who hit a similar issue

Thanks for adding me.

> On 28/08/2019 21:19, Guillaume Tucker wrote:
>> The merge_config.sh script verifies that all the config options have
>> their expected value in the resulting file and prints any issues as
>> warnings.  These checks aren't intended to be treated as errors given
>> the current implementation.  However, since "set -e" was added, if the
>> grep command to look for a config option does not find it the script
>> will then abort prematurely.
>>
>> Handle the case where the grep exit status is non-zero by setting
>> ACTUAL_VAL to an empty string to restore previous functionality.
>>
>> Fixes: cdfca821571d ("merge_config.sh: Check error codes from make")
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> ---
>>  scripts/kconfig/merge_config.sh | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
>> index d924c51d28b7..d673268d414b 100755
>> --- a/scripts/kconfig/merge_config.sh
>> +++ b/scripts/kconfig/merge_config.sh
>> @@ -177,7 +177,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>>  for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
>>  
>>  	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
>> -	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
>> +	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || echo)

Shouldn't this just be 'true' instead of 'echo'?

Cheers
Jon

-- 
nvpublic
