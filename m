From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH REPOST] ARM: tegra: use dt-binding header for key code
Date: Wed, 18 Sep 2013 22:08:54 +0530
Message-ID: <5239D71E.3040005@nvidia.com>
References: <1379510552-23401-1-git-send-email-ldewangan@nvidia.com> <5239C6AC.10403@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5239C6AC.10403@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 18 September 2013 08:58 PM, Stephen Warren wrote:
> On 09/18/2013 07:22 AM, Laxman Dewangan wrote:
>> In place of hardcoding the key code in DTS file and comment the
>> key code as side notes, use the key code macro defines in the
>> dt-bindings/input/input.h directly.
> I can apply this, but aren't there many other Tegra DT files that need
> conversion too?
Yes, I am planning to this in next few days. I will post different 
patches for different boards.
If it is fine to you, it can be applied this patch.
