From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/8] PM / devfreq: tegra: Fix kHz to Hz conversion
Date: Fri, 12 Apr 2019 13:14:59 +0300
Message-ID: <2fd58a4d-7179-91ce-3f01-898c958abdd5@gmail.com>
References: <20190411222914.25539-2-digetx@gmail.com>
 <20190412013413.4D52D20818@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412013413.4D52D20818@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.04.2019 4:34, Sasha Levin пишет:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.0.7, v4.19.34, v4.14.111, v4.9.168, v4.4.178, v3.18.138.
> 
> v5.0.7: Build OK!
> v4.19.34: Build OK!
> v4.14.111: Build OK!
> v4.9.168: Failed to apply! Possible dependencies:
>     0f0fe7e01327 ("PM / OPP: Manage supply's voltage/current in a separate structure")
>     37a73ec0c9bb ("PM / OPP: Add per OPP table mutex")
>     63a69ea4b88f ("PM / OPP: Rename _allocate_opp() to _opp_allocate()")
>     7034764a1e4a ("PM / OPP: Add 'struct kref' to struct dev_pm_opp")
>     8a31d9d94297 ("PM / OPP: Update OPP users to put reference")
>     947355850fcb ("PM / OPP: Separate out _generic_set_opp()")
>     969fceb3c7e6 ("PM / OPP: Add light weight _opp_free() routine")
>     ce31781a7574 ("PM / OPP: Pass struct dev_pm_opp_supply to _set_opp_voltage()")
>     dfbe4678d709 ("PM / OPP: Add infrastructure to manage multiple regulators")
> 
> v4.4.178: Failed to apply! Possible dependencies:
>     01fb4d3c39d3 ("PM / OPP: Parse 'opp-<prop>-<name>' bindings")
>     0c717d0f9cb4 ("PM / OPP: Initialize regulator pointer to an error value")
>     2c2709dc6921 ("PM / OPP: Rename structures for clarity")
>     50f8cfbd5897 ("PM / OPP: Parse clock-latency and voltage-tolerance for v1 bindings")
>     655c9df96175 ("PM / OPP: Introduce dev_pm_opp_get_max_volt_latency()")
>     7de36b0aa51a ("PM / OPP: Parse 'opp-supported-hw' binding")
>     8a31d9d94297 ("PM / OPP: Update OPP users to put reference")
>     9f8ea969d5cf ("PM / OPP: get/put regulators from OPP core")
>     d54974c2513f ("PM / OPP: Manage device clk")
>     dc4e7b1fa20a ("PM / OPP: Add missing doc comments")
>     deaa51465105 ("PM / OPP: Add debugfs support")
> 
> v3.18.138: Failed to apply! Possible dependencies:
>     07cce74a7b25 ("PM / OPP: handle allocation of device_opp in a separate routine")
>     0fe30da2cb43 ("PM / OPP: fix warning in of_free_opp_table()")
>     11573e9132ae ("PM / devfreq: tegra: Update to v5 of the submitted patches")
>     129eec55df6a ("PM / OPP Introduce APIs to remove OPPs")
>     29df0ee1b14a ("PM / OPP: reuse find_device_opp() instead of duplicating code")
>     2c2709dc6921 ("PM / OPP: Rename structures for clarity")
>     327854c87117 ("PM / OPP: Ensure consistent naming of static functions")
>     38393409da34 ("PM / OPP mark OPPs as 'static' or 'dynamic'")
>     6234f38016ad ("PM / devfreq: tegra: add devfreq driver for Tegra Activity Monitor")
>     737002b5de3d ("PM / OPP: Relocate few routines")
>     86453b473b1f ("PM / OPP: Staticize __dev_pm_opp_remove()")
>     87b4115db023 ("PM / OPP: Protect updates to list_dev with mutex")
>     8a31d9d94297 ("PM / OPP: Update OPP users to put reference")
>     8d4d4e98acd6 ("PM / OPP: Add helpers for initializing CPU OPPs")
>     984f16c8490c ("PM / OPP: Update kernel documentation")
>     a7470db6fec4 ("PM / OPP don't match for existing OPPs when list is empty")
>     b02ded246d01 ("PM / OPP: add some lockdep annotations")
>     b4037aaa584b ("PM / OPP replace kfree_rcu() with call_srcu() in opp_set_availability()")
>     cd1a068a52ee ("PM / OPP rename 'head' as 'rcu_head' or 'srcu_head' based on its type")
>     f59d3ee8480d ("PM / OPP: Move cpu specific code to opp/cpu.c")
> 
> 
> How should we proceed with this patch?

Don't backport to v4.9 and older, it's not a critical fix at all.
