Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5F3C4167B
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Feb 2022 05:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbiBAFUN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Feb 2022 00:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbiBAFUL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Feb 2022 00:20:11 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725F7C061401
        for <linux-tegra@vger.kernel.org>; Mon, 31 Jan 2022 21:20:11 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id q186so31199776oih.8
        for <linux-tegra@vger.kernel.org>; Mon, 31 Jan 2022 21:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W3pkuXcD6//2M4IafSNtYUk0ekeqEUBNIypKPlcgXSg=;
        b=NGaVgCVpuCF7KW9wQEbk/yftac+yJ4TTG6i1IzF/n47+5Mc2D8OINvU06KfuaLBRXF
         gpnD2XtD1IEpYAh415FTi29uaGHURLWzJOse7iFZMiGI+zaJ4PvGHOb+rrCT/gmgwBZh
         gSaMmIJsMLP2gKUkzP6udbMqV/3JIFjIqCV1xmtZ5BPyQELQjo0nSYXxDBnHHCryQp32
         2CpCVCLsad1sODHh8dOoRi9k3n03qQcNBqv9JsvoVUEdJkIgioWXmP93yLh7hhQ/U0cc
         ueJMvHGxErnAiZarKMhjoOrQ4VFaQjkUbVIqViaj2chDIT63he30WFM9Mw0jCfARBQKd
         86kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W3pkuXcD6//2M4IafSNtYUk0ekeqEUBNIypKPlcgXSg=;
        b=sJ6XHhqfS7gcYsC/yQ0czIKIEeWapenQSHX7wBXqVBoPfW4KlHEcTBYJrVyhQVu4CA
         32t5LynFSzv/nY9aV1RuPLgOXFFGiJK+tBErJGdrQzuPs/JGfZdd94dFPD3FR6gz1wFN
         2LfUsUKKqHlATvVbv2SJeprVqo9n3tzsERurHVVIPbkkqzKm4OYgXgrFHrjBBmqTCGUA
         1Pvar91/1nrLiOQdOc53ob/cdRQdiaTZVj1JPxQUhZ9tgGb3wX9fipGIHjV8vDAH4r43
         iE5u3AiMKeQuJqbauPW3UEUSItbWkQWQTBpXMluRtHrfEafcnSmsS/lFSVAlUVi/m4QT
         0hTQ==
X-Gm-Message-State: AOAM5312LOuWEjB6mEd+9ZS07h8n5y3ntwosrsT7uSi43CsxONecQbtn
        x9RfmvQ2I4Hvx1BKtvBZAvWgpA==
X-Google-Smtp-Source: ABdhPJyf+Wbq4ePHvO/Z19AWRX3YaNZ61EuN8lo4bOYD6TfN0gDQgCabFLnPy4NGWrQUZWX7OykxAg==
X-Received: by 2002:a05:6808:e85:: with SMTP id k5mr223269oil.238.1643692810811;
        Mon, 31 Jan 2022 21:20:10 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:10 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Baruch Siach <baruch@tkos.co.il>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Baruch Siach <baruch.siach@siklu.com>
Subject: Re: (subset) [PATCH v4 1/3] arm64: dts: qcom: ipq6018: add pcie max-link-speed
Date:   Mon, 31 Jan 2022 23:19:20 -0600
Message-Id: <164369277344.3095904.10731707140943455148.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <fcf41277cf8529437374a5c10b2b1fcad30cd7c2.1640587131.git.baruch@tkos.co.il>
References: <cover.1640587131.git.baruch@tkos.co.il> <fcf41277cf8529437374a5c10b2b1fcad30cd7c2.1640587131.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 27 Dec 2021 08:46:03 +0200, Baruch Siach wrote:
> From: Baruch Siach <baruch.siach@siklu.com>
> 
> Add the generic 'max-link-speed' property to describe the IPQ6018 PCIe
> link generation limit. This allows the generic dwc code to configure the
> link speed correctly.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: ipq6018: add pcie max-link-speed
      commit: e3e8a472429923d1c430bf388e9e3df1d9cc63a7

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
