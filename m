From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: tps6586x: add support for input supply
Date: Tue, 24 Jul 2012 09:59:19 +0530
Message-ID: <500E249F.4080700@nvidia.com>
References: <1342187432-18668-1-git-send-email-ldewangan@nvidia.com> <1342187432-18668-3-git-send-email-ldewangan@nvidia.com> <500DB960.6020802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <500DB960.6020802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 24 July 2012 02:21 AM, Stephen Warren wrote:
> On 07/13/2012 07:50 AM, Laxman Dewangan wrote:
>>     sm[0-2], ldo[0-9] and ldo_rtc
>> +- sm0-supply: The input supply for the SM0.
>> +- sm1-supply: The input supply for the SM1.
>> +- sm2-supply: The input supply for the SM2.
>> +- vinldo01-supply: The input supply for the LDO1 and LDO2
>> +- vinldo23-supply: The input supply for the LDO2 and LDO3
>> +- vinldo4-supply: The input supply for the LDO4
>> +- vinldo678-supply: The input supply for the LDO6, LDO7 and LDO8
>> +- vinldo9-supply: The input supply for the LDO9
> Hmm. The signal names in my data sheet are VIN_SMn and VINLDOn, so
> having "vin" in just some of the property names seems a little inconsistent.
>

My bad, not sure why I missed it.  I will send the patch for correcting 
this before Tegra's board ventana/harmony fills the dt entry.
