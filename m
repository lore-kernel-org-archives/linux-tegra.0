From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5.4 000/344] 5.4.22-stable review
Date: Mon, 24 Feb 2020 11:19:56 +0000
Message-ID: <1a6e640e-6d6f-26f8-d24d-025f32aa042e@nvidia.com>
References: <20200221072349.335551332@linuxfoundation.org>
 <529a5a4a-974e-995a-9556-c2a14d09bb5d@nvidia.com>
 <CA+G9fYv-KC0v++YsyXR-rhC2JBGUfhNGD+XYaZjN3fJSX1x_mg@mail.gmail.com>
 <f671fbf6-1cd5-ae8a-82e7-d3aba63e9840@ti.com>
 <20200223172604.GC349989@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200223172604.GC349989@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tero Kristo <t-kristo@ti.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, "tony@atomide.com" <tony@atomide.com>, open list <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, Shuah Khan <shuah@kernel.org>, patches@kernelci.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, lkft-triage@lists.linaro.org, linux- stable <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org


On 23/02/2020 17:26, Greg Kroah-Hartman wrote:

...

> I've dropped the offending patch now, sorry about that.
> 
> greg k-h


Thanks. I know that it is already out but FWIW, looks good to me ...


Test results for stable-v5.4:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	5.4.22-gf22dcb31727e
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
