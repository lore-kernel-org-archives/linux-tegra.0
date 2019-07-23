From: Viswanath L <viswanathl@nvidia.com>
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
Date: Tue, 23 Jul 2019 15:41:05 +0530
Message-ID: <fe7a0f13-4e85-56db-7629-92c6a8f67014@nvidia.com>
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
 <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Thanks for your comments, Dmitry. Please see my responses inline.

On 7/23/2019 6:00 AM, Dmitry Osipenko wrote:
> 22.07.2019 12:27, Viswanath L =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> HDMI plugout calls runtime suspend, which clears interrupt registers
>> and causes audio functionality to break on subsequent plugin; setting
>> interrupt registers in sor_audio_prepare() solves the issue
> Hello Viswanath,
>
> A dot should be in the end of sentence, please. And should be better to
> s/plugin/plug-in/ in the commit's message/title because 'plugin' sounds
> as a noun.
[VL] Yes, I'll make the above changes.
>
> Please don't version patch as v2 if v1 wasn't ever sent out.
[VL] Now that I have sent v2, shall I continue with v2 for the next=20
patch? Apologies for this oversight.
>
> You should add a stable tag here to get patch backported into stable
> kernel versions:
>
> Cc: <stable@vger.kernel.org>
[VL] Yes, will add.
>
>> Signed-off-by: Viswanath L <viswanathl@nvidia.com>
> The kernel upstreaming rules require a full name. I'm pretty sure that L
> isn't yours surname.
[VL] My name appears as "Viswanath L" in all company records and email=20
lists. I would strongly prefer to keep it this way, unless that is an=20
absolute no-no.
>> ---
>>   drivers/gpu/drm/tegra/sor.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
>> index 5be5a08..0470cfe 100644
>> --- a/drivers/gpu/drm/tegra/sor.c
>> +++ b/drivers/gpu/drm/tegra/sor.c
>> @@ -2164,6 +2164,15 @@ static void tegra_sor_audio_prepare(struct tegra_=
sor *sor)
>>  =20
>>   	value =3D SOR_AUDIO_HDA_PRESENSE_ELDV | SOR_AUDIO_HDA_PRESENSE_PD;
>>   	tegra_sor_writel(sor, value, SOR_AUDIO_HDA_PRESENSE);
>> +
>> +	/*
>> +	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
>> +	 * is used for interoperability between the HDA codec driver and the
>> +	 * HDMI/DP driver.
>> +	 */
>> +	value =3D SOR_INT_CODEC_SCRATCH1 | SOR_INT_CODEC_SCRATCH0;
>> +	tegra_sor_writel(sor, value, SOR_INT_ENABLE);
>> +	tegra_sor_writel(sor, value, SOR_INT_MASK);
>>   }
>>  =20
>>   static void tegra_sor_audio_unprepare(struct tegra_sor *sor)
>> @@ -2913,15 +2922,6 @@ static int tegra_sor_init(struct host1x_client *c=
lient)
>>   	if (err < 0)
>>   		return err;
>>  =20
>> -	/*
>> -	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
>> -	 * is used for interoperability between the HDA codec driver and the
>> -	 * HDMI/DP driver.
>> -	 */
>> -	value =3D SOR_INT_CODEC_SCRATCH1 | SOR_INT_CODEC_SCRATCH0;
>> -	tegra_sor_writel(sor, value, SOR_INT_ENABLE);
>> -	tegra_sor_writel(sor, value, SOR_INT_MASK);
>> -
>>   	return 0;
>>   }
>>  =20
>>
