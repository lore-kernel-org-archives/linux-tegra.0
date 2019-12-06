From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: stable request: 5.4.y: arm64: tegra: Fix 'active-low' warning for
 Jetson
Date: Fri, 6 Dec 2019 13:16:15 +0000
Message-ID: <ee190492-5af8-7ef1-5524-4f260d64094d@nvidia.com>
References: <16724779-0514-ca92-58b2-95f4e244c6f7@nvidia.com>
 <20191206125334.GA1361962@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191206125334.GA1361962@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org


On 06/12/2019 12:53, Greg Kroah-Hartman wrote:
> On Fri, Dec 06, 2019 at 10:55:17AM +0000, Jon Hunter wrote:
>> Hi Greg,
>>
>> Please can you include the following device-tree fixes for 5.4.y that
>> are triggering some warnings on a couple of our Jetson platforms. This
>> is currently causing one of our kernel warnings tests to fail. Both of
>> these have now been merged into the mainline for v5.5-rc1.
>>
>> commit d440538e5f219900a9fc9d96fd10727b4d2b3c48
>> Author: Jon Hunter <jonathanh@nvidia.com>
>> Date:   Wed Sep 25 15:12:28 2019 +0100
>>
>>     arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator
>>
>> commit 1e5e929c009559bd7e898ac8e17a5d01037cb057
>> Author: Jon Hunter <jonathanh@nvidia.com>
>> Date:   Wed Sep 25 15:12:29 2019 +0100
>>
>>     arm64: tegra: Fix 'active-low' warning for Jetson TX1 regulator
>>
>> Thanks
>> Jon
> 
> Now queued up, thanks.

Thanks. BTW were you also able to queue the following? This is another
one that is needed for 5.4.y.

commit c745da8d4320c49e54662c0a8f7cb6b8204f44c4
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Fri Oct 11 09:34:59 2019 +0100

    mailbox: tegra: Fix superfluous IRQ error message

Cheers
Jon

-- 
nvpublic
