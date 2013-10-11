From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] hwmon: (lm90) Add support for TI TMP451
Date: Fri, 11 Oct 2013 09:57:50 +0800
Message-ID: <52575B1E.60504@nvidia.com>
References: <1381297248-13375-1-git-send-email-wni@nvidia.com> <20131009151744.GA7787@roeck-us.net> <20131009173555.74c0d5f5@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131009173555.74c0d5f5-R0o5gVi9kd7kN2dkZ6Wm7A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 11:35 PM, Jean Delvare wrote:
> On Wed, 9 Oct 2013 08:17:44 -0700, Guenter Roeck wrote:
>> On Wed, Oct 09, 2013 at 01:40:48PM +0800, Wei Ni wrote:
>>> TI TMP451 is mostly compatible with ADT7461, except for
>>> local temperature low byte and max conversion rate.
>>> Add support to the LM90 driver.
>>>
>>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>
>> Jean, I assume you'll take this one ? Otherwise, please let me know.
> 
> Yes I will, thank for the review.

Hi, Jean, do you have git repository, so that I can clone it to get
latest changes.

Thanks.
Wei.
> 
