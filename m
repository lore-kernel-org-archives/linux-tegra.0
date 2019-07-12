From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5.1 000/138] 5.1.18-stable review
Date: Fri, 12 Jul 2019 14:26:57 +0100
Message-ID: <4dae64c8-046e-3647-52d6-43362e986d21@nvidia.com>
References: <20190712121628.731888964@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712121628.731888964@linuxfoundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, j-keerthy@ti.com
List-Id: linux-tegra@vger.kernel.org

Hi Greg,

On 12/07/2019 13:17, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.1.18 release.
> There are 138 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun 14 Jul 2019 12:14:36 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.1.18-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
> -------------
> Pseudo-Shortlog of commits:

...

> Keerthy <j-keerthy@ti.com>
>     ARM: dts: dra71x: Disable usb4_tm target module

...

> Keerthy <j-keerthy@ti.com>
>     ARM: dts: dra76x: Disable usb4_tm target module

The above commits are generating the following compilation errors for
ARM ...

Error:
/dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm/boot/dts/dra71x.dtsi:15.1-9
Label or path usb4_tm not found

Error:
/dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm/boot/dts/dra76x.dtsi:89.1-9
Label or path usb4_tm not found

After reverting these two, I no longer see these errors.

Cheers,
Jon

-- 
nvpublic
