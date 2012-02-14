From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/3] net: rfkill-gpio: add device tree support
Date: Tue, 14 Feb 2012 11:14:58 +0100
Message-ID: <4F3A3422.7020304@gmx.de>
References: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de> <1329161159.22948.3.camel@rklein-linux> <CAOesGMgJW7bRZn84VSZNVvc3G6z4S6HPzFEv3MJ8DcNYVsV2uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgJW7bRZn84VSZNVvc3G6z4S6HPzFEv3MJ8DcNYVsV2uQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 13.02.2012 20:36, schrieb Olof Johansson:
> On Mon, Feb 13, 2012 at 11:25 AM, Rhyland Klein<rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>  wrote:
>> On Sun, 2012-02-12 at 11:13 -0800, Marc Dietrich wrote:
>>> This adds device tree support for rfkill-gpio. The optional platform
>>> paramters gpio_runtime_close and gpio_runtime_setup are not implemented.
>>>
>>> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: "John W. Linville"<linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
>>> Cc: Johannes Berg<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
>>> Cc: Rhyland Klein<rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Marc Dietrich<marvin24-Mmb7MZpHnFY@public.gmane.org>
>>> +
>>>   static int rfkill_gpio_probe(struct platform_device *pdev)
>>>   {
>>>        struct rfkill_gpio_data *rfkill;
>>>        struct rfkill_gpio_platform_data *pdata = pdev->dev.platform_data;
>>> +     struct device_node *np = pdev->dev.of_node;
>>>        int ret = 0;
>>>        int len = 0;
>>>
>>> +     if (np)
>>> +             pdata = rfkill_gpio_parse_pdata(pdev);
>>> +
>> The only concern I have is the precedence of devicetree settings vs
>> platform data settings? If there is pdata passed in from board file
>> initialization, and there is a device tree (a corner case but I think a
>> valid one) then I believe the order would be that defined pdata would
>> override the devicetree settings. That way if someone wanted to make a
>> quick update, they wouldn't need to change the boot loader as well.
> Yes, that is how other drivers tend to be coded -- only of pdata is
> null will the driver try to fill in from the DT.

If the device tree from the bootloader does not contain the rfkill 
information the resources from platform_data will be used (so no need to 
update the bootloader). If the bootloader contains rfkill information, 
why shouldn't it be used?

Marc
