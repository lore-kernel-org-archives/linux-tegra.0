From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 20/20] usb: host: ehci-tegra: Remove unused fields from
 tegra_ehci_hcd
Date: Tue, 7 Jan 2020 19:13:12 +0300
Message-ID: <b5c262a9-4a7f-6293-e3c4-31ba4822cd12@gmail.com>
References: <Pine.LNX.4.44L0.2001061014430.1514-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.2001061014430.1514-100000@iolanthe.rowland.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.01.2020 18:16, Alan Stern пишет:
> On Mon, 6 Jan 2020, Dmitry Osipenko wrote:
> 
>> There are few stale fields in tegra_ehci_hcd structure, let's remove them.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/host/ehci-tegra.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
>> index 1eb94205a5ac..d6433f206c17 100644
>> --- a/drivers/usb/host/ehci-tegra.c
>> +++ b/drivers/usb/host/ehci-tegra.c
>> @@ -42,12 +42,10 @@ struct tegra_ehci_soc_config {
>>  };
>>  
>>  struct tegra_ehci_hcd {
>> -	struct tegra_usb_phy *phy;
>>  	struct clk *clk;
>>  	struct reset_control *rst;
>>  	int port_resuming;
>>  	bool needs_double_reset;
>> -	enum tegra_usb_phy_port_speed port_speed;
>>  };
>>  
>>  static int tegra_reset_usb_controller(struct platform_device *pdev)
> 
> For patches 2, 19, and 20:
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> It's nice to see that patch 2 makes the sequence of events in 
> tegra_ehci_remove() exactly the same as the failure pathway in 
> tegra_ehci_probe().

Thank you very much for taking a look at the patches!
