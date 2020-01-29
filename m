From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Date: Wed, 29 Jan 2020 21:56:27 +0300
Message-ID: <d53d1bde-f677-cfa4-3315-24788171c917@gmail.com>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
 <20200117232254.2792-4-richardw.yang@linux.intel.com>
 <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
 <20200128004301.GD20624@richard>
 <d66bb20e-c0e7-caef-cbbc-aa216c2be7d6@gmail.com>
 <20200128232907.GA11467@richard>
 <27b70b0c-7945-cc85-8321-d9e4b6f17865@gmail.com>
 <20200129002838.GA12835@richard>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200129002838.GA12835@richard>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, akpm@linux-foundation.org, dan.j.williams@intel.com, aneesh.kumar@linux.ibm.com, kirill@shutemov.name, yang.shi@linux.alibaba.com, thellstrom@vmware.com, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

29.01.2020 03:28, Wei Yang пишет:
...
>>> I would prepare another patch set to fix this. Would you mind helping me
>>> verify on your platform?
>>
>> Sure, please feel free to CC me on that patch.
> 
> Thanks, you are in the cc list of v2.
> 
> Hope this one works fine on ARM.

Okay, I'll reply to the v2 after some more extensive testing (tomorrow).
