From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: paz00: export the WIFI rfkill gpio
Date: Fri, 15 Jul 2011 21:25:00 +0400
Message-ID: <4E2077EC.1070902@ru.mvista.com>
References: <1310725464-2524-1-git-send-email-marvin24@gmx.de>	<1310725464-2524-3-git-send-email-marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF049E834C2F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834C2F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Collin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello.

Stephen Warren wrote:

>> This makes the WIFI rfkill gpio available to userspace. On boot,
>> WIFI will be unblocked by default.
> ...
>> +static void __init paz00_wifi_init(void)
>> +{
>> +	int ret;
>> +
>> +	/* unlock hw rfkill */
>> +	ret = gpio_request_one(TEGRA_WIFI_PWRN, GPIOF_OUT_INIT_HIGH,
>> +		"wifi pwrn");
>> +	if (ret) {
>> +		pr_warning("WIFI: could not requestrfkill gpio\n");
>> +		return;
>> +	}
>> +	gpio_export(TEGRA_WIFI_PWRN, 0);
>> +};
> 
> Wouldn't you want to skip the gpio_export() call if the gpio_request()
> call failed?

    I think that's what he does -- there's a *return* statement.

WBR, Sergei
