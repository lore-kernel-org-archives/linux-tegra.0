From: Matthew Longnecker <mlongnecker@nvidia.com>
Subject: Re: [PATCH v2 0/2] Support to tune governor in run time
Date: Mon, 13 Jan 2014 11:01:36 -0800
Message-ID: <52D43810.6030801@nvidia.com>
References: <1389611863-7812-1-git-send-email-wni@nvidia.com> <52D4095C.205@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <52D4095C.205@ti.com>
Sender: linux-pm-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 1/13/2014 7:42 AM, Eduardo Valentin wrote:
>> This serie can support to turn governor for thermal zone in
>> run time.
>
> Can you please explain why this is needed? Are you facing troubles with
> current way to switch governors? If yes, can you please report them?
>

....

>> Adds thermal_update_governor() function, so the thermal platform
>> driver can use it to update governor.
>
> Here I cannot see why the platform driver would need to update a
> governor, instead of a zone. Platform drivers are not supposed to be
> aware of governors. For updating a zone we already have an API for that,
> please check documentation.
>

I think we have a miscommunication. The purpose of 
thermal_update_governor is to *switch* governors at runtime (from within 
the kernel).

Wei has used the term "update" in the sense of switch rather than 
"update" in the sense used by thermal_zone_device_update.

Eduardo, what is your recommended technique for setting the governor of 
a thermal zone device created via device tree?

thanks,
Matt

