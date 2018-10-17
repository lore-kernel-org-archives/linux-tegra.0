From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: tegra20: Enable lock-status polling for PLLs
Date: Wed, 17 Oct 2018 14:52:27 +0300
Message-ID: <2e877ee7-2977-496b-5073-772256c76191@gmail.com>
References: <20180830184210.5369-1-digetx@gmail.com>
 <20180830184210.5369-2-digetx@gmail.com>
 <20180831092948.GP1636@tbergstrom-lnx.Nvidia.com>
 <909e2a52-4116-9ee7-db23-8ea1dfffade0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <909e2a52-4116-9ee7-db23-8ea1dfffade0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 8/31/18 12:45 PM, Dmitry Osipenko wrote:
> On 8/31/18 12:29 PM, Peter De Schrijver wrote:
>> On Thu, Aug 30, 2018 at 09:42:10PM +0300, Dmitry Osipenko wrote:
>>> Currently all PLL's on Tegra20 use a hardcoded delay despite of having
>>> a lock-status bit. The lock-status polling was disabled ~7 years ago
>>> because PLLE was failing to lock and was a suspicion that other PLLs
>>> might be faulty too. Other PLLs are okay, hence enable the lock-status
>>> polling for them. This reduces delay of any operation that require PLL
>>> to lock.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> v2:	Don't enable polling for PLLE as it known to not being able to lock.
>>>
>>
>> This isn't correct. The lock bit of PLLE can declare lock too early, but the
>> PLL itself does lock.
> 
> Indeed, it locks but can't be polled for the lock-status as it doesn't have the
> lock-status bit.

Actually it has lock-status bit. Not sure how I managed to miss it before.
