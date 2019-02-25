From: Jon Hunter <jonathanh@nvidia.com>
Subject: stable request: 4.20.y: ASoC: soc-core: fix init platform memory
 handling
Date: Mon, 25 Feb 2019 11:42:06 +0000
Message-ID: <310bdda2-39be-38ce-f0d6-ca011ccac580@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>, Mark Brown <broonie@kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Greg,

While testing v4.20.y on Tegra I noticed that the kernel is crashing on
boot if certain sound-cards are probe deferred. This issue has been
fixed in the mainline by the following commit ...

commit 09ac6a817bd687e7f5dac00470262efdd72f9319
Author: Curtis Malainey <cujomalainey@chromium.org>
Date:   Thu Jan 10 16:21:04 2019 -0800

    ASoC: soc-core: fix init platform memory handling

I have verified that this applies cleanly and resolves the issue on
v4.20.y. Please can we include for the v4.20.y stable branch?

Cheers
Jon

-- 
nvpublic
