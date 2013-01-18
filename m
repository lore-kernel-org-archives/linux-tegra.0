From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] USB: PHY: Tegra: Get rid of instance number to differentiate
 PHY type
Date: Fri, 18 Jan 2013 10:07:46 -0700
Message-ID: <50F98162.3040401@wwwdotorg.org>
References: <1358343022-28919-1-git-send-email-vbyravarasu@nvidia.com> <1358343022-28919-4-git-send-email-vbyravarasu@nvidia.com> <50F98089.6040008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F98089.6040008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/18/2013 10:04 AM, Stephen Warren wrote:
> On 01/16/2013 06:30 AM, Venu Byravarasu wrote:
>> Tegra20 USB has 3 PHY instances:
>> Instance 1 and 3 are UTMI. Instance 2 is ULPI.
>>
>> As instance number was used to differentiate ULPI from UTMI,
>> used DT param to get this info and processed accordingly.
> 
>> diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
>> index f03e157..a6a89d4 100644
>> --- a/include/linux/usb/tegra_usb_phy.h
>> +++ b/include/linux/usb/tegra_usb_phy.h
>> @@ -60,6 +60,7 @@ struct tegra_usb_phy {
>>  	struct usb_phy u_phy;
>>  	struct device *dev;
>>  	bool is_legacy_phy;
>> +	bool is_ulpi_phy;
>>  };
> 
> I see the code that uses this new field, but it doesn't appear to be set
> anywhere...

Oh, I see that code ended up being part of patch 4. Can you please
repost the series with that chunk moved into patch 3 where it belongs?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
