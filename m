From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V2 05/10] firmware: tegra: add BPMP support
Date: Thu, 7 Jul 2016 11:24:39 +0900
Message-ID: <CAAVeFuKd_w6jJbAXPNOX+M7aAgS9doR6c5h1QxHbRySRgzviHQ@mail.gmail.com>
References: <20160705090431.5852-1-josephl@nvidia.com>
 <20160705090431.5852-6-josephl@nvidia.com>
 <CAAVeFuKvp4d=RoPZGGLmhqXs1oHZPrEOxTJd_b6b7-rHq_mqqg@mail.gmail.com>
 <577D363A.4010003@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <577D363A.4010003@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Longnecker <mlongnecker@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <catalin.marinas@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jassi Brar <jassisinghbrar@gmail.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 7, 2016 at 1:47 AM, Matt Longnecker <mlongnecker@nvidia.com> wrote:
> Alex,
>
>
> On 07/06/2016 04:39 AM, Alexandre Courbot wrote:
>>>
>>> diff --git a/include/soc/tegra/bpmp_abi.h b/include/soc/tegra/bpmp_abi.h
>>> >new file mode 100644
>>> >index 000000000000..0aaef5960e29
>>> >--- /dev/null
>>> >+++ b/include/soc/tegra/bpmp_abi.h
>>> >@@ -0,0 +1,1601 @@
>>> >+/*
>>> >+ * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
>>> >+ *
>>> >+ * This program is free software; you can redistribute it and/or modify
>>> > it
>>> >+ * under the terms and conditions of the GNU General Public License,
>>> >+ * version 2, as published by the Free Software Foundation.
>>> >+ *
>>> >+ * This program is distributed in the hope it will be useful, but
>>> > WITHOUT
>>> >+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>>> > or
>>> >+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
>>> > License for
>>> >+ * more details.
>>> >+ *
>>> >+ * You should have received a copy of the GNU General Public License
>>> >+ * along with this program.  If not, see<http://www.gnu.org/licenses/>.
>>> >+ */
>>> >+
>>> >+#ifndef_ABI_BPMP_ABI_H_
>>> >+#define_ABI_BPMP_ABI_H_
>>> >+
>>>
>> ...
>>
>> There is a lot of stuff in this file, most of which we are not using
>> now - this is ok, but unless this is a file synced from an outside
>> resource maybe we should trim the structures we don't need and add
>> them as we make use of them? It helps dividing the work in bite-size
>> chunks.
>>
>> Regarding the documentation format of this file, is this valid kernel
>> documentation since the adoption of Sphynx? Or is it whatever the
>> origin is using?
>
> bpmp_abi.h is meant to be delivered as is from an NVIDIA internal repo to a
> variety of OS'es. Each of them has a different documentation standard and
> coding standard.
>
> I'd like to avoid trimming parts from the file (or even worse modifying
> parts of the file) so that future deliveries are trivial.

Makes sense, thanks to you and Stephen for the clarification.
