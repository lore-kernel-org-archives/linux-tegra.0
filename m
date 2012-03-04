From: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM: tegra: USB_ULPI needs USB
Date: Sun, 04 Mar 2012 14:46:28 -0500
Message-ID: <4F53C694.5060308@signal11.us>
References: <1330721919-8800-1-git-send-email-alan@signal11.us> <20120304184015.GE31064@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120304184015.GE31064-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 3/4/12 1:40 PM, Olof Johansson wrote:
> On Fri, Mar 02, 2012 at 03:58:39PM -0500, Alan Ott wrote:
>> From: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
>>
>> The USB_ULPI driver is selected by tegra, but can only be
>> built if at least one of USB or USB_GADGET is enabled.
>> The kernel fails to link if both are off.
>>
>> Signed-off-by: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
>> Signed-off-by: Alan Ott<alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
>> ---
> This is another patch that needs the same change for T30.
>
>
> -Olof

It is in v3. It looks like you took (or at least replied to) v2 for all 
these.

Alan.
