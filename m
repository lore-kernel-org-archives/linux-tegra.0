From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] serial: 8250_tegra: Create Tegra specific 8250 driver
Date: Tue, 21 Jan 2020 21:46:11 +0300
Message-ID: <176b695b-6790-ff26-8c32-a3920639e6ca@gmail.com>
References: <20200120160149.29072-1-jonathanh@nvidia.com>
 <f02faa4c-5838-15d2-1b76-75c17fcc0d9d@gmail.com>
 <714eb00b-bb49-9536-ce9c-8928941edef3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <714eb00b-bb49-9536-ce9c-8928941edef3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Brasen <jbrasen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

21.01.2020 21:34, Jon Hunter пишет:
> 
> On 21/01/2020 16:31, Dmitry Osipenko wrote:
>> Hello Jon,
>>
>> 20.01.2020 19:01, Jon Hunter пишет:
>>
>> [snip]
>>
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	if (!res)
>>> +		return -ENODEV;
>>> +
>>> +	port->membase = devm_ioremap(&pdev->dev, res->start,
>>> +				     resource_size(res));
>>
>> devm_platform_ioremap_resource()
> 
> That would be ideal, but we cannot. The driver needs the res structure
> as well later on.

Oh, indeed.
