From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] PCI: PM: Skip devices in D0 for suspend-to-idle
Date: Tue, 25 Jun 2019 13:46:40 +0100
Message-ID: <f233d8fe-9525-05de-858d-e7456a17bd4b@nvidia.com>
References: <1668247.RaJIPSxJUN@kreacher>
 <CAJZ5v0hdtXqoK84DpYtyMSCnkR9zOHFiUPAzWZDtkFmEjyWD1g@mail.gmail.com>
 <CAJZ5v0gGdXmgc_9r2rbiadq4e31hngpjYQ40QoC6C0z19da_hQ@mail.gmail.com>
 <2287147.DxjcvLeq6l@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2287147.DxjcvLeq6l@kreacher>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Keith Busch <kbusch@kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 25/06/2019 00:09, Rafael J. Wysocki wrote:
> On Tuesday, June 25, 2019 12:20:26 AM CEST Rafael J. Wysocki wrote:
>> On Mon, Jun 24, 2019 at 11:37 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>>>
>>> On Mon, Jun 24, 2019 at 2:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>
>>>> Hi Rafael,
>>>>
>>>> On 13/06/2019 22:59, Rafael J. Wysocki wrote:
>>>>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>>>
>>>>> Commit d491f2b75237 ("PCI: PM: Avoid possible suspend-to-idle issue")
>>>>> attempted to avoid a problem with devices whose drivers want them to
>>>>> stay in D0 over suspend-to-idle and resume, but it did not go as far
>>>>> as it should with that.
>>>>>
>>>>> Namely, first of all, the power state of a PCI bridge with a
>>>>> downstream device in D0 must be D0 (based on the PCI PM spec r1.2,
>>>>> sec 6, table 6-1, if the bridge is not in D0, there can be no PCI
>>>>> transactions on its secondary bus), but that is not actively enforced
>>>>> during system-wide PM transitions, so use the skip_bus_pm flag
>>>>> introduced by commit d491f2b75237 for that.
>>>>>
>>>>> Second, the configuration of devices left in D0 (whatever the reason)
>>>>> during suspend-to-idle need not be changed and attempting to put them
>>>>> into D0 again by force is pointless, so explicitly avoid doing that.
>>>>>
>>>>> Fixes: d491f2b75237 ("PCI: PM: Avoid possible suspend-to-idle issue")
>>>>> Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>>>> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>
>>>> I have noticed a regression in both the mainline and -next branches on
>>>> one of our boards when testing suspend. The bisect is point to this
>>>> commit and reverting on top of mainline does fix the problem. So far I
>>>> have not looked at this in close detail but kernel log is showing ...
>>>
>>> Can you please collect a log like that, but with dynamic debug in
>>> pci-driver.c enabled?
>>>
>>> Note that reverting this commit is rather out of the question, so we
>>> need to get to the bottom of the failure.
>>
>> I suspect that there is a problem with the pm_suspend_via_firmware()
>> check which returns 'false' on the affected board, but the platform
>> actually removes power from devices left in D0 during suspend.
>>
>> I guess it would be more appropriate to check something like
>> pm_suspend_no_platform() which would return 'true' in the
>> suspend-to-idle patch w/ ACPI.
> 
> So I wonder if the patch below makes any difference?

Thanks. I will try this now and let you know.

Cheers!
Jon

-- 
nvpublic
