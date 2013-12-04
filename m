From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] ARM: tegra: convert device tree file of Dalmore to
 use pinctrl defines
Date: Wed, 04 Dec 2013 09:59:52 -0700
Message-ID: <529F5F88.8010101@wwwdotorg.org>
References: <1385992502-12771-1-git-send-email-ldewangan@nvidia.com> <1385992502-12771-2-git-send-email-ldewangan@nvidia.com> <529E3A6E.1050003@wwwdotorg.org> <529EC2E5.5050909@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <529EC2E5.5050909@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 12/03/2013 10:51 PM, Laxman Dewangan wrote:
> On Wednesday 04 December 2013 01:39 AM, Stephen Warren wrote:
>> On 12/02/2013 06:55 AM, Laxman Dewangan wrote:
>>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Patch description?
>>
>> BTW, did you compile all the Tegra DT files before and after this
>> change, and make sure that there's zero difference between them (i.e.
>> they're identical byte-for-byte when compiled)? I don't feel like
>> manually double-checking this entire patch...
> 
> I just made changes for the Dalmore only. Not touched Tegra30 and
> Tegra20_ platform dts.

OK. Why not convert all the DTs at once?

> For Dalmore, I compare the binary before and after this change as well
> dts generated back from dtb using dtc.
> It is same.

Great.
