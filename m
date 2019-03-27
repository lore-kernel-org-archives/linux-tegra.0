From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 1/2] bus: tegra-aconnect: use devm_clk_*() helpers
Date: Wed, 27 Mar 2019 13:18:53 +0000
Message-ID: <67a87b1d-b22f-f1c6-b792-cf180797409a@nvidia.com>
References: <1552452119-6574-1-git-send-email-spujar@nvidia.com>
 <32ab970f-d6a3-1232-77f1-41f97cc04f9a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32ab970f-d6a3-1232-77f1-41f97cc04f9a@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, treding@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 27/03/2019 11:10, Sameer Pujar wrote:
> Hi Reviewers,
> 
> Request for review and approval.

Fine with me. I think you have my reviewed/acked-by.

If there are any changes we need to make, we could also use the clk_bulk
APIs here too. However, not critical.

Cheers
Jon

-- 
nvpublic
