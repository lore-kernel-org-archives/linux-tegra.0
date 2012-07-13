From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: How to use the generic thermal sysfs.
Date: Fri, 13 Jul 2012 14:48:45 +0900
Message-ID: <4FFFB6BD.903@nvidia.com>
References: <1342088573.27605.101.camel@tegra-chromium-2> <4D68720C2E767A4AA6A8796D42C8EB5915287C@BGSMSX101.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D68720C2E767A4AA6A8796D42C8EB5915287C@BGSMSX101.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: Wei Ni <wni@nvidia.com>, "Zhang, Rui" <rui.zhang@intel.com>, "Brown, Len" <len.brown@intel.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "khali@linux-fr.org" <khali@linux-fr.org>, "joe@perches.com" <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@ger.kernel.org" <linux-tegra@ger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 07/12/2012 07:54 PM, R, Durgadoss wrote:
> We are working on a notification API from any generic sensor driver to
> the thermal framework.
> Please have a look at the 'notify_thermal_framework' API in the patch here:
> http://www.spinics.net/lists/linux-acpi/msg36049.html

At first sight these patches look close to what we need as well. Are you 
considering to support the definitions of thermal zones using the device 
tree? Is there a public git tree where we can pull the latest version of 
this code in order to keep in sync with you guys?

Thanks,
Alex.
