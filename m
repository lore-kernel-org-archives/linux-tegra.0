From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 17/19] ARM: tegra: Update sound node clocks in device
 tree
Date: Wed, 18 Dec 2019 09:39:44 +0300
Message-ID: <f76bf618-607a-af87-f652-4117ed050b70@gmail.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-18-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576613046-17159-18-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.12.2019 23:04, Sowjanya Komatineni пишет:
> clk_out_1, clk_out_2, and clk_out_3 are part of Tegra PMC block
> and are moved from clock driver to pmc driver with pmc as clock
> provider.
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
> 	t=1576613055; bh=aZWp4sScdv8qprM+UpGS0w1DX7YelR50gFqoThf23X4=;
> 	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
> 	 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
> 	 Content-Type;
> 	b=p9EmVtuTvJK6owqo0lmnZnAvftCWc6+7Mkp/Ks9y26tKN5c4jU+I+YEAaMWoHuzd+
> 	 7n0vS98WNMGomj19IUXoaH49IeTgPAlqOkU57IIiL2qEnX3sYNYpl/rCRUIs7vd33t
> 	 LSn8tQeu9Lz+Yfl8hvXcN3sdxRQOEPDYwzWG+tVy1FCnwouTHSfBhgado2Tx/9cWgi
> 	 HlSWkzjvodag7mAmZtLCl5P4J+oVEJnpYnjSZKNojqszn8u651ErvnVI/VbhZwQ0G5
> 	 Yg8kEr8YECPk2L4MXUe8J2YmKtNyZaADOkUhjyxqMjZ2bGrB9RDm5dKNFxkWuEeSpb
> 	 U3nMi7MNcvBmQ==

Looks like NVIDIA's mail server has some problems.

[snip]
